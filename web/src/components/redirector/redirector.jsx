import React, { Component } from 'react';
import axios from 'axios';
import { mobileModel, getUA } from 'react-device-detect';

class Redirector extends Component {
  componentDidMount() {
    console.log('componentdidmount');
    const deviceType = mobileModel === 'none' ? 'Desktop' : mobileModel;
    const { shortCode } = this.props.match.params;

    axios.get('http://www.geoplugin.net/json.gp').then((geo) => {
      const clientIP = geo.data.geoplugin_request;

      axios.post('http://localhost:3000/redirect', {
        code: shortCode,
        device: deviceType,
        ip: clientIP,
        ua: getUA,
      }).then((response) => {
        const redirectTo = response.data;
        window.location = redirectTo;
      });
    });
  }

  render() {
    return <span>Redirecting....</span>;
  }
}

export default Redirector;
