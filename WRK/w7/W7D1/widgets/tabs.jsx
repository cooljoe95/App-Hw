import React from 'react';
import TabHeaders from './tab_headers';

export default class Tab extends React.Component{
  constructor(props) {
    super(props);
    this.state = {selected: 0 };
    this.switchTab = this.switchTab.bind(this);
  }

  switchTab(toTab) {
    this.setState({selected: toTab});
  }

  render() {
    const selected = this.state.selected;
    const that = this;
    const headers = this.props.tabs.map((tab, idx) => {
      return (
        <TabHeaders tabSwitch={that.switchTab} title={tab.title} tabIdx={idx} selected={ selected} />
      );
    });

    const content = this.props.tabs.map((tab, idx) => {
      if (idx === selected) {
        return tab.content;
      }
    });

    return (
      <div>
        <ul>
          {headers}
        </ul>
        <section>{content}</section>
      </div>
    );
  }
}
