import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

import './dashboard.css';

class Dashboard extends Component {
  constructor(props) {
    super(props);
    console.log('dashboard props', props);

    this.state = {
      links: [],
    };
  }

  componentDidMount() {
    axios.get('http://localhost:3000/links').then((response) => {
      const links = response.data;
      this.setState({ links });
    });
  }

  render() {
    return (
      <div>
        <table>
          <thead>
            <tr>
              <th>Original URL</th>
              <th>Shortened URL</th>
              <th>Number of clicks</th>
            </tr>
          </thead>
          <tbody>
            {this.state.links.map(link =>
              (
                <tr key={link.id}>
                  <td>{link.original}</td>
                  <td>
                    <Link
                      to={`//${window.location.host}/${link.short}`}
                      target="_blank"
                    >{`${window.location.host}/${link.short}`}
                    </Link>
                  </td>
                  <td>{link.click_count}</td>
                  <td>
                    <Link to={`links/${link.id}`}>Details</Link>
                  </td>
                </tr>))}
          </tbody>
        </table>
      </div>
    );
  }
}

export default Dashboard;
