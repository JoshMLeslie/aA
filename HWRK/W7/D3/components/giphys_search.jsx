import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        searchTerm: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update (field) {
    return e => {
      this.setState({[field] : e.target.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
    this.setState({
      searchTerm: '' // reset
    });
  }


  render() {

    return (
    <form onSubmit={this.handleSubmit}>
      Just use enter to submit.
      <br />
      <input

        type="text"
        onChange={this.update('searchTerm')
        } />
    </form>
    );
  }
}

export default GiphysSearch;
