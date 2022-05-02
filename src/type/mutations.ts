export enum Role {
  ADMIN = 'ADMIN',
  BARBER = 'BARBER',
  GUEST = 'GUEST'
}

export interface UserMutationInput {
  id?: Number | null
  role: Role,
  name: string,
  email: string,
  phone: string
}

export interface ServiceMutationInput {
  id?: Number | null
  name: string,
  price: Number,
  duration: Number,
  barbers: UserMutationInput[],
  requests: RequestMutationInput[]
}

export interface RequestMutationInput {
  id?: Number | null
  serviceId: string,
  barberId: string,
  clientId: string,
  price: Number,
  date: string
}