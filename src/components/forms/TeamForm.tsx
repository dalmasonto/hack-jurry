import { Button, Group, TextInput } from '@mantine/core';
import { useForm } from '@mantine/form';
import { notifications } from '@mantine/notifications';
import { Team } from '../../types';
import { supabase } from '../../lib/supabase';

interface TeamFormProps {
  hackathonId: string;
  opened: boolean;
  onClose: () => void;
  onSuccess: () => void;
  editingTeam?: Team | null;
}

export function TeamForm({ hackathonId, onClose, onSuccess, editingTeam }: TeamFormProps) {
  const form = useForm<{
    name: string;
    project_name: string;
    members: string[];
    hackathon_members: string;
  }>({
    initialValues: {
      name: editingTeam?.name || '',
      project_name: editingTeam?.project_name || '',
      members: editingTeam?.members || [],
      hackathon_members: editingTeam?.members.join(',') || ''
    },
    validate: {
      name: (value: string) => (!value ? 'Team name is required' : null),
      project_name: (value: string) => (!value ? 'Project name is required' : null),
      hackathon_members: (value: string) => (!value ? 'At least one team member is required' : null)
    }
  });
  console.log("Editing team: ", editingTeam)
  const handleSubmit = async (values: typeof form.values) => {
    try {
      const rawMembers = (values.hackathon_members || '')
        .split(',');

      const members = Array.from(rawMembers);
      if (members.length === 0) {
        notifications.show({
          title: 'Error',
          message: 'At least one team member is required',
          color: 'red'
        });
        return;
      }

      const valueToSubmit: Omit<Team, 'id' | 'created_at'> = {
        name: values.name,
        project_name: values.project_name,
        members,
        hackathon_id: hackathonId
      };

      if (!valueToSubmit.hackathon_id) {
        notifications.show({
          title: 'Error',
          message: 'Invalid hackathon ID',
          color: 'red'
        });
        return;
      }

      try {
        if (editingTeam) {
          const { error } = await supabase
            .from('teams')
            .update(valueToSubmit)
            .eq('id', editingTeam.id)
            .eq('hackathon_id', hackathonId);

          if (error) throw error;
        } else {
          const { error } = await supabase
            .from('teams')
            .insert([valueToSubmit]);

          if (error) {
            if (error.code === '23505') {
              throw new Error('A team with this name already exists in this hackathon');
            }
            throw error;
          }
        }

        notifications.show({
          title: 'Success',
          message: `Team ${editingTeam ? 'updated' : 'added'} successfully`,
          color: 'green'
        });

        form.reset();
        onSuccess();
        onClose();
      } catch (error: any) {
        notifications.show({
          title: 'Error',
          message: error.message || `Failed to ${editingTeam ? 'update' : 'add'} team`,
          color: 'red'
        });
      }
    } catch (error: any) {
      notifications.show({
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
          label="Team Name"
          placeholder="Enter team name"
          {...form.getInputProps('name')}
          mb="md"
          radius={"md"}
        />
        <TextInput
          required
          label="Project Name"
          placeholder="Enter project name"
          {...form.getInputProps('project_name')}
          mb="md"
          radius={"md"}
        />
        <TextInput
          required
          label="Team Members"
          description="Enter team member names separated by commas ie. 'John Doe, Jane Doe'"
          placeholder="Enter team member names (comma-separated)"
          {...form.getInputProps('hackathon_members')}
          mb="md"
          radius={"md"}
        />
        <Group justify="flex-end">
          <Button variant="light" radius={"md"} onClick={onClose}>Cancel</Button>
          <Button type="submit" radius={"md"}>{editingTeam ? 'Update' : 'Add'} Team</Button>
        </Group>
      </form>
  );
}
