import jdenticon from "jdenticon/standalone";

export const limitChars = (str: string, limit: number) => {
  if (str.length > limit) {
    return str.substring(0, limit) + '...';
  }
  return str;
};

export function generateAvatar(seed: string, size = 200) {
    const svg = jdenticon.toSvg(seed, size);
    return `data:image/svg+xml;base64,${btoa(svg)}`;
}
