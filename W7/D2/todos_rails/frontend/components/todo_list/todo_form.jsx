import React from 'react';
import { uniqueID } from '../../util/util';

export class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        title: "",
        body: "",
        done: false
      };
    this.handleSubmit = this.handleSubmit.bind(this);

   }

   update(property) {
     return e => this.setState({[property]: e.target.value});
   }

   handleSubmit(e) {
     e.preventDefault();
     const todo = Object.assign({}, this.state,  {id: uniqueID()} );
     debugger
     this.props.createTodo({ todo }).then(
       () => this.setState({
         title: '',
         body: ''
         })
     );
   }

   render () {
     return (
       // <input onChange={this.update('title')} value={this.state.title}/>
       // <button onSubmit={this.handleSubmit} />
       <div>
         <span>The to-do is: </span>
         <form onSubmit={this.handleSubmit}>
           <input onChange={this.update('title')} value={this.state.title}/>
           <input onChange={this.update('body')} value={this.state.body}/>

           <button />
         </form>

       </div>
     );
   }
 }
