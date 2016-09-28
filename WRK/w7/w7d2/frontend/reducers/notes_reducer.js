import { KEY_PRESSED, KEY_RELEASED } from '../actions/note_actions';
import { NOTE_NAMES } from '../util/tones';

export default (state = [], action = {}) => {
  switch(action.type){
    case (KEY_PRESSED):
      if (!state.includes(action.key) && NOTE_NAMES.includes(action.key)) {
        return [action.key, ...state];
      } else {
        return state;
      }
      break;
    case(KEY_RELEASED):
      const releasedKeyIdx = state.indexOf(action.key);
      if (releasedKeyIdx !== -1) {
        return state.slice(0, releasedKeyIdx).concat(state.slice(releasedKeyIdx + 1));
      } else {
        return state;
      }
      break;
    default: return state;

  }
};
