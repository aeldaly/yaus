import React, { Component } from 'react';
import axios from 'axios';

import './shorten.css';

class Shorten extends Component {
  constructor(props) {
    super(props);

    this.state = {
      original: null,
      short: null,
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ original: event.target.value });
  }

  handleSubmit(event) {
    axios.post('http://localhost:3000/shorten', { url: this.state.original }).then((response) => {
      this.setState({ short: response.data.short });
    });
    event.preventDefault();
  }

  render() {
    return (
      <div className="container">
        <form onSubmit={this.handleSubmit}>
          <label>
            Link:
            <input
              type="url"
              name="original"
              className="text"
              value={this.state.value}
              onChange={this.handleChange}
            />
          </label>

          <input
            type="submit"
            value="Shorten"
            className="submit"
          />
        </form>

        {
          this.state.short ? 
            <div className="result">The shortened URL is: <a href={window.location + this.state.short}>{ window.location + this.state.short }</a></div>
          : null
        }
      </div>
    );
  }
}

export default Shorten;
