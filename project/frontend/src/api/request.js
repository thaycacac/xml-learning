import axios from 'axios'

const service = axios.create({
  baseURL: 'http://localhost:7985/api',
  timeout: 5000
})

service.interceptors.request.use(
  config => {
    config.headers['Content-Type'] = 'text/xml'
    return config
  },
  error => {
    console.log(error)
    return Promise.reject(error)
  }
)

export default service  