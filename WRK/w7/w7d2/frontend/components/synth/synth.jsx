import React from 'react';
import Note from '../../util/note';
import { TONES } from '../../util/tones';
import { NOTE_NAMES } from '../../util/tones';
import $ from 'jquery';
import NoteKey from './note_key';

export default class Synth extends React.Component {
  constructor(props) {
    super(props);
    this.notes = NOTE_NAMES.map((note_name) => {
      return new Note(TONES[note_name]);
    });

    this.onKeyDown = this.onKeyDown.bind(this);
    this.onKeyUp = this.onKeyUp.bind(this);
    this.playNotes = this.playNotes.bind(this);
  }

  onKeyDown(e) {
    this.props.keyPressed(e.key);
  }

  onKeyUp(e) {
    this.props.keyReleased(e.key);
  }

  playNotes(){
    NOTE_NAMES.forEach((note, idx) => {
      if (this.props.notes.includes(note)) {
        this.notes[idx].start();
      } else {
        this.notes[idx].stop();
      }
    });
  }

  componentDidMount() {
    $(document).on('keydown', e => this.onKeyDown(e));
    $(document).on('keyup', e => this.onKeyUp(e)); //is "keyup" right?
  }

  render() {
    this.playNotes();
    const note_keys = NOTE_NAMES.map((note_name, idx) => {
      return NoteKey(note_name);
    });
    // debugger
    return(
      <ul>
        {note_keys}
      </ul>
    );
  }
}
