import { useState } from 'react';

import { useNuiEvent } from './hooks/useNuiEvent';
import { fetchNui } from './utils/fetchNui';

interface PlayerData {
  name: string;
  callsign: string;
  job: string;
  grade: string;
  gradeLevel: number;
}

interface Department {
  label: string;
  shortName: string;
  color: string;
}

export function App() {
  const [isOpen, setIsOpen] = useState(false);
  const [player, setPlayer] = useState<PlayerData | null>(null);
  const [department, setDepartment] = useState<Department | null>(null);

  useNuiEvent<{ player: PlayerData; department: Department }>('open', (data) => {
    setIsOpen(true);
    setPlayer(data.player);
    setDepartment(data.department);
  });

  useNuiEvent('close', () => {
    setIsOpen(false);
  });

  const handleClose = async () => {
    await fetchNui('close');
    setIsOpen(false);
  };

  if (!isOpen) return null;

  return (
    <div className="flex items-center justify-center w-full h-full">
      <div className="w-[85vw] h-[85vh] bg-zinc-900 rounded-xl border border-zinc-700 shadow-2xl flex overflow-hidden">
        {/* Sidebar */}
        <nav className="w-56 bg-zinc-950 border-r border-zinc-800 p-4 flex flex-col">
          <div className="mb-6">
            <h1 className="text-lg font-bold text-white">Foundation MDT</h1>
            {department && (
              <p className="text-xs text-zinc-400 mt-1">{department.shortName}</p>
            )}
          </div>

          <div className="flex-1 space-y-1">
            <SidebarItem label="Dashboard" active />
            <SidebarItem label="Profiles" />
            <SidebarItem label="Vehicles" />
            <SidebarItem label="Warrants" />
            <SidebarItem label="BOLOs" />
            <SidebarItem label="Reports" />
            <SidebarItem label="Units" />
            <SidebarItem label="Dispatch" />
            <SidebarItem label="Evidence" />
            <SidebarItem label="Penal Codes" />
            <SidebarItem label="Roster" />
          </div>

          {player && (
            <div className="border-t border-zinc-800 pt-3 mt-3">
              <p className="text-sm text-white font-medium">{player.name}</p>
              <p className="text-xs text-zinc-400">{player.grade} | {player.callsign}</p>
            </div>
          )}
        </nav>

        {/* Main Content */}
        <main className="flex-1 flex flex-col">
          <header className="h-12 border-b border-zinc-800 flex items-center justify-between px-4">
            <h2 className="text-sm font-medium text-white">Dashboard</h2>
            <button
              onClick={handleClose}
              className="text-zinc-400 hover:text-white text-sm transition-colors"
            >
              Close (ESC)
            </button>
          </header>
          <div className="flex-1 p-6 overflow-auto">
            <p className="text-zinc-400">Foundation MDT is loading...</p>
          </div>
        </main>
      </div>
    </div>
  );
}

function SidebarItem({ label, active }: { label: string; active?: boolean }) {
  return (
    <button
      className={`w-full text-left px-3 py-2 rounded-md text-sm transition-colors ${
        active
          ? 'bg-zinc-800 text-white'
          : 'text-zinc-400 hover:text-white hover:bg-zinc-800/50'
      }`}
    >
      {label}
    </button>
  );
}
