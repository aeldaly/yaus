import React, { Component } from 'react';

import { Shorten } from './components/shorten';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <h1>YAUS</h1>
          <h1 className="App-title">The Millenial URL Shortener</h1>
        </header>
        
        <Shorten />
      </div>
    );
  }
}

export default App;
