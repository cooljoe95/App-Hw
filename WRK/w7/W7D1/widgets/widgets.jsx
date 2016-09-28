import Tab from './tabs';

import React from 'react';
import ReactDOM from 'react-dom';

import Weather from './weather_app';
import Autocomplete from './autocomplete_app';

const Widgets = () => {
  return (
    <div>
      <Autocomplete names={[
          "Josh",
          "Joe",
          "James",
          "OtherName",
          "MoreNames",
          "Name5",
          "Cthulu the Destroyer",
          "Joshua"
        ]}/>
      <Tab tabs={[
          {"title": "firstTab", "content": "firstContent" },
          {"title": "secondTab", "content": "secondContent" },
          {"title": "thirdTab", "content": "thirdContent" },
        ]}/>
      <Weather/>
    </div>
  );
};

document.addEventListener("DOMContentLoaded", ()=>{

  ReactDOM.render(
    <Widgets />, document.getElementById("root")
  );

});
