export enum Role {
  ADMIN = 'ADMIN',
  BARBER = 'BARBER',
  GUEST = 'GUEST'
}

export interface UserMutationInput {
  id?: string | null
  role: Role,
  name: string,
  email: string,
  phone: string
}

export interface ServiceMutationInput {
  id?: string | null
  name: string,
  price: Number,
  duration: Number,
}

export interface RequestMutationInput {
  id?: string | null
  serviceId: string,
  barberId: string,
  clientId: string,
  price: Number,
  date: string
}