import React from 'react';

const TabHeaders = ({ title, tabIdx, selected, tabSwitch}) => {
  if (tabIdx === selected) {
    return(
      <strong>
        <li onClick={tabSwitch.bind(null, tabIdx)}>
          {title}
        </li>
      </strong>
    );
  } else {
    return(
      <li onClick={tabSwitch.bind(null, tabIdx)}>
        {title}
      </li>
    );
  }
}
export default TabHeaders;
