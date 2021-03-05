import { START, NOTSTART } from "../actionTypes";

const initialState = false


const start = (state = initialState, action) => {
  switch (action.type) {
    case START:
      return action.status;
    case NOTSTART:
      return action.status;
    default:
      return state;
  }
};

export default start;