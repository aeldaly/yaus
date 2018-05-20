import React from 'react';
import { BrowserRouter, Route, Link, Switch } from 'react-router-dom';

import Shorten from './components/shorten/shorten';
import Dashboard from './components/dashboard/dashboard';
import Details from './components/details/details';
import Redirector from './components/redirector/redirector';
import './App.css';

const App = () => (
  <BrowserRouter>
    <div className="App">
      <header className="App-header">
        <h1>YAUS</h1>
        <h1 className="App-title">The Millenial URL Shortener</h1>
      </header>

      <nav>
        <ul>
          <li><Link to="/">Shorten URL</Link></li>
          <li><Link to="/dashboard">Dashboard</Link></li>
        </ul>
      </nav>

      <Route exact path="/" component={Shorten} />
      <Route path="/links/:linkId" component={Details} />
      <Switch>
        <Route exact path="/dashboard" component={Dashboard} />
        <Route exact path="/:shortCode" component={Redirector} />
      </Switch>
    </div>
  </BrowserRouter>
);

export default App;
