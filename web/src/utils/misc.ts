export const noop = () => {};

export function debugData<T>(events: { action: string; data: T }[]) {
  if (import.meta.env.MODE === 'development') {
    for (const event of events) {
      setTimeout(() => {
        window.dispatchEvent(
          new MessageEvent('message', {
            data: event,
          }),
        );
      }, 200);
    }
  }
}
