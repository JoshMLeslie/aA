import React from 'react';
import merge from 'lodash/merge';
import { withRouter } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return (
      e => this.setState({ [field]: e.currentTarget.value })
    );
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = merge({},this.state);
    this.props.processForm(user);
  }

  renderErrors () {
    const errors = this.props.errors.sessionErrors;

    return (
      <ul>
        {errors.map((error, i) => {
            return (
              <li key={i}>
                {error}
              </li>
        );  })  }
      </ul>
    );
  }

  render () {
    return (
      <form onSubmit={this.handleSubmit} value={this.props.formType}>

        {this.renderErrors()}

        <br />

        <h3>You have two options: {this.props.formType} here or {this.props.navLink} there</h3>
        <h4>{`Or leave, that's also an option. You're not trapped here.`}</h4>

        <br />

        <label>Username:
          <input
            type="text"
            value={this.state.username}
            onChange={this.update('username')}
            />
        </label>

        <br />

        <label>Password:
          <input
            type="password"
            onChange={this.update('password')}
            />
        </label>

        <br />

        <button>Assimilate</button>
      </form>
    );
  }
}

export default withRouter(SessionForm);
