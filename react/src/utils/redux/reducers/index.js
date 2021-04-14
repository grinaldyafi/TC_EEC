import { combineReducers } from 'redux'; 
import user from './user'
import submit from './submit'

export default combineReducers({ user, submit });