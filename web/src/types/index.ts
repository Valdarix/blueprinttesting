export interface Citizen {
  id: string;
  firstname: string;
  lastname: string;
  dob: string;
  gender: string;
  phone: string;
  licenses: Record<string, boolean>;
}

export interface Vehicle {
  plate: string;
  model: string;
  color: string;
  owner: string;
  flags: string[];
}

export interface Warrant {
  id: number;
  citizenId: string;
  citizenName: string;
  title: string;
  description: string;
  charges: string[];
  issuingOfficer: string;
  department: string;
  status: 'active' | 'served' | 'expired' | 'cancelled';
  createdAt: string;
}

export interface BOLO {
  id: number;
  type: 'person' | 'vehicle';
  title: string;
  description: string;
  citizenId?: string;
  plate?: string;
  vehicleModel?: string;
  vehicleColor?: string;
  lastSeenLocation?: string;
  issuingOfficer: string;
  department: string;
  status: 'active' | 'resolved' | 'expired';
  priority: 'low' | 'medium' | 'high' | 'critical';
  createdAt: string;
}

export interface Report {
  id: number;
  title: string;
  description: string;
  incidentType: string;
  location: string;
  citizensInvolved: string[];
  charges: string[];
  evidence: Evidence[];
  officer: string;
  department: string;
  status: 'draft' | 'filed' | 'closed';
  createdAt: string;
}

export interface Evidence {
  id: number;
  type: 'mugshot' | 'photo' | 'document';
  url: string;
  description: string;
  uploadedBy: string;
  createdAt: string;
}

export interface Unit {
  id: number;
  citizenId: string;
  name: string;
  callsign: string;
  status: 'available' | 'busy' | 'enroute' | 'on-scene' | 'off-duty';
  department: string;
  assignedCall?: number;
}

export interface PenalCode {
  code: string;
  title: string;
  category: string;
  type: 'infraction' | 'misdemeanor' | 'felony';
  fine: number;
  jailTime: number;
  points: number;
}

export interface PlayerData {
  name: string;
  callsign: string;
  job: string;
  grade: string;
  gradeLevel: number;
}

export interface Department {
  label: string;
  shortName: string;
  color: string;
}
