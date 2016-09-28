import React from 'react';

export default class Autocomplete extends React.Component{
  constructor (props){
    super(props);

    this.state = { matchedNames: props.names };
    this.filterNames = this.filterNames.bind(this);
    this.clickHandler = this.clickHandler.bind(this);
  }

  filterNames(event){
    const substring = event.currentTarget.value;
    const result = [];

    this.props.names.forEach((name) => {
      for (let i = 0; i < substring.length; i++) {
        if (substring[i].toLowerCase() !== name[i].toLowerCase()) {
          return;
        } else {
          if (i + 1 === substring.length) {
            result.push(name);
          }
        }
      }
    });

    if (substring === "") {
      this.setState({matchedNames: this.props.names});
    } else {
      this.setState({matchedNames: result});
    }
  }

  clickHandler(event){
    const clickName = event.currentTarget.innerHTML;
    document.querySelector('input').value = clickName;
    this.setState({matchedNames: [clickName]});
  }

  render () {
    const nameList = this.state.matchedNames.map((name) => {
        return (
          <li onClick={this.clickHandler}>{name}</li>
        );
      });

    return (
      <div>
        <input onChange={this.filterNames} className="input">

        </input>
        <ul>
          {nameList}
        </ul>
      </div>
    );
  }
}
