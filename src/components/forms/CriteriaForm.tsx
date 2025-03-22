import { Button, Group, NumberInput, TextInput, Textarea } from '@mantine/core';
import { useForm } from '@mantine/form';
import { showNotification } from '@mantine/notifications';
import { JudgingCriteria } from '../../types';
import { supabase } from '../../lib/supabase';

interface CriteriaFormProps {
  hackathonId: string;
  opened: boolean;
  onClose: () => void;
  onSuccess: () => void;
  editingCriteria?: JudgingCriteria | null;
}

export function CriteriaForm({ hackathonId, onClose, onSuccess, editingCriteria }: CriteriaFormProps) {
  const form = useForm<{
    name: string;
    description: string;
    max_score: number;
  }>({
    initialValues: {
      name: editingCriteria?.name || "",
      description: editingCriteria?.description || "",
      max_score: editingCriteria?.max_score || 5
    },
    validate: {
      name: (value: string) => (!value ? 'Criteria name is required' : null),
      max_score: (value: number) => (value <= 0 ? 'Maximum score must be greater than 0' : null)
    }
  });

  const handleSubmit = async (values: typeof form.values) => {
    try {
      const valueToSubmit: Omit<JudgingCriteria, 'id' | 'created_at'> = {
        name: values.name,
        description: values.description,
        max_score: values.max_score,
        hackathon_id: hackathonId
      };

      if (!valueToSubmit.hackathon_id) {
        showNotification({
          title: 'Error',
          message: 'Invalid hackathon ID',
          color: 'red'
        });
        return;
      }

      try {
        if (editingCriteria) {
          const { error } = await supabase
            .from('judging_criteria')
            .update(valueToSubmit)
            .eq('id', editingCriteria.id)
            .eq('hackathon_id', hackathonId);

          if (error) throw error;
        } else {
          const { error } = await supabase
            .from('judging_criteria')
            .insert([valueToSubmit]);

          if (error) throw error;
        }

        showNotification({
          title: 'Success',
          message: `Criteria ${editingCriteria ? 'updated' : 'added'} successfully`,
          color: 'green'
        });

        form.reset();
        onSuccess();
        onClose();
      } catch (error: any) {
        showNotification({
          title: 'Error',
          message: error.message || `Failed to ${editingCriteria ? 'update' : 'add'} criteria`,
          color: 'red'
        });
      }
    } catch (error: any) {
      showNotification({
        title: 'Error',
        message: error.message,
        color: 'red'
      });
    }
  };

  return (
    <form onSubmit={form.onSubmit(handleSubmit)}>
      <TextInput
        required
        label="Criteria Name"
        placeholder="Enter criteria name"
        {...form.getInputProps('name')}
        mb="md"
        radius={"md"}
      />
      <Textarea
        label="Description"
        placeholder="Enter criteria description"
        {...form.getInputProps('description')}
        mb="md"
        radius={"md"}
      rows={5}
      />
      <NumberInput
        required
        label="Maximum Score"
        placeholder="Enter maximum score"
        min={1}
        {...form.getInputProps('max_score')}
        mb="md"
        radius={"md"}
      />
      <Group justify="flex-end">
        <Button variant="light" onClick={onClose} radius={"md"}>Cancel</Button>
        <Button type="submit" radius={"md"}>{editingCriteria ? 'Update' : 'Add'} Criteria</Button>
      </Group>
    </form>
  );
}
