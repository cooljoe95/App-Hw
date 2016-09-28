import { START_RECORDING, STOP_RECORDING, ADD_NOTES } from '../actions/tracks_actions';
import merge from 'lodash/merge';

let curTrackId = 0;

export default (state = [], action = {}) => {
  let curTrack;
  switch(action.type){
    case(START_RECORDING):
      curTrackId++;
      const newTrack = {
        id: curTrackId,
        name: `Track ${curTrackId}`,
        roll: [],
        timeStart: Date.now()
      };
      const dupedTracks = merge(state); // Will overwrite, if things go wrong, start here.
      dupedTracks.push(newTrack);
      return dupedTracks;
    case(STOP_RECORDING):
      curTrack = merge(state);
      curTrack.roll.push({notes: [], timeSlice: action.timeNow - curTrack[curTrackId - 1].timeStart});
      return curTrack;
    case(ADD_NOTES):
      curTrack = merge(state);
      curTrack.roll.push({notes: action.notes, timeSlice: action.timeNow - curTrack[curTrackId - 1].timeStart });
      return curTrack;
    default:
      return state;
  }
};
