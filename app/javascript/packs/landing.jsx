import React from 'react'
import Header from './Login/Header'
import axios from 'axios'

class Landing extends React.Component {
constructor(){
    super();
    this.state = {
      currentUser: null
    }
    this.updateCurrentUser = this.updateCurrentUser.bind(this);
  }
componentDidMount(){
    let that = this
    axios.get('/users/check_for_user')
      .then((response) => {
        console.log(response.data);
      if(response.data.email){
        that.setState({
          currentUser: response.data.email
        })
      } else {
        that.setState({
          currentUser: null
        })
      }
    }, error => {
      console.log(error);
    })
}

updateCurrentUser(email) {
    this.setState({
      currentUser: email
    })
}

render(){
    return (
      <div>
        <Header updateCurrentUser={this.updateCurrentUser}/>
      </div>
    )
  }
}

export default Landing