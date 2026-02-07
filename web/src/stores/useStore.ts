import { create } from 'zustand';

interface MDTState {
  activeTab: string;
  setActiveTab: (tab: string) => void;
}

export const useStore = create<MDTState>((set) => ({
  activeTab: 'dashboard',
  setActiveTab: (tab) => set({ activeTab: tab }),
}));
