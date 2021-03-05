import { combineReducers } from 'redux'; 
import auth from './auth'
import user from './user'
import start from './start'
import submit from './submit'

export default combineReducers({ auth, user, start, submit });