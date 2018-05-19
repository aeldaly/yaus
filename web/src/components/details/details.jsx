import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

class Details extends Component {
  constructor(props) {
    super(props);

    this.state = {
      linkId: this.props.match.params.linkId,
      details: [],
    };
  }

  componentDidMount() {
    axios.get(`http://localhost:3000/links/${this.state.linkId}`).then((response) => {
      const details = response.data;
      this.setState({ details });
    });
  }

  render() {
    return (
      <div>
        <Link to="/dashboard">Back to list</Link>
        <table>
          <thead>
            <tr>
              <th>Link</th>
              <th>Device</th>
              <th>Client IP</th>
              <th>User Agent</th>
              <th>Time</th>
            </tr>
          </thead>
          <tbody>
            {this.state.details.map(link =>
              (
                <tr key={link.id}>
                  <td>{link.original}</td>
                  <td>{link.device}</td>
                  <td>{link.ip}</td>
                  <td>{link.ua}</td>
                  <td>{link.created_at}</td>
                </tr>))}
          </tbody>
        </table>
      </div>
    );
  }
}

export default Details;
