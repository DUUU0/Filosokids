import axios, { AxiosError } from "axios";


export function setupAPIClient(){

    const api = axios.create({
        baseURL: 'http://localhost:3333',
        headers: {
            Authorization: `Bearer ${sessionStorage["token"]}`
        }
    })

    return api
}