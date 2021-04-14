import { createStore } from 'redux';
// import { createStore, applyMiddleware  } from 'redux';
import rootReducer from './reducers'
// import { createStateSyncMiddleware, initMessageListener } from 'redux-state-sync';
 

export default createStore(rootReducer);


// //sync with all tabs

// const config = {
//     // TOGGLE_TODO will not be triggered in other tabs
//     // blacklist: ['TOGGLE_TODO'],
// };

// const middlewares = [createStateSyncMiddleware(config)];
// const store = createStore(rootReducer, {}, applyMiddleware(...middlewares));
// // this is used to pass store.dsipatch to the message listener
// initMessageListener(store);

// export default store