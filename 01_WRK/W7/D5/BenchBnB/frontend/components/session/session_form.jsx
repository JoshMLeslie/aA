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
    return (
      this
      .props
      .errors
      .map((error, i) => {
        return (
          <li key={`error-${i}`}> {error} </li>
        );
      })
    );
  }

  render () {
    return (
      <form onSubmit={this.handleSubmit} value={this.props.formType}>
        <fieldset>
          <legend>{this.props.formLegend}</legend>

          <div className="head-box">
            <h4>Or {this.props.navLink}</h4>

            <ul>{this.renderErrors()}</ul>
          </div>

          <section>
            <p>Or leave, that's also an option.<br />
            You're not trapped here.</p>

            <label id="field-username">Username:
              <input
                type="text"
                value={this.state.username}
                onChange={this.update('username')}
                />
            </label>

            <br />

            <label id="field-password">Password:
              <input
                type="password"
                onChange={this.update('password')}
                />
            </label>
            <br />
            <br />
            <div id="form-button">
              <button >Assimilate</button>
            </div>
          </section>
        </fieldset>
      </form>
    );
  }
}

export default withRouter(SessionForm);
