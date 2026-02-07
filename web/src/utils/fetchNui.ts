const isEnvBrowser = (): boolean =>
  !(window as unknown as Record<string, unknown>).GetParentResourceName;

export async function fetchNui<T = unknown>(
  eventName: string,
  data?: unknown,
  mockData?: T,
): Promise<T> {
  if (isEnvBrowser() && mockData) return mockData;

  const resourceName = (window as unknown as Record<string, unknown>).GetParentResourceName
    ? (window as unknown as Record<string, (() => string) | undefined>).GetParentResourceName!()
    : 'nui-frame-app';

  const resp = await fetch(`https://${resourceName}/${eventName}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify(data),
  });

  return await resp.json();
}
