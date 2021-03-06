import React, { Component } from 'react';
import { Loader } from '..';
import { api } from '../../services';
import './Post.css';

class Post extends Component {
  state = {
    post: null,
    shoudCancel: false
  }

  componentDidMount() {
    this.loadPost();
  }

  componentWillUnmount() {
    this.shoudCancel = true;
  }

  loadPost = async () => {
    const { match: { params } } = this.props;
    try {
      const post = await api.Posts.findOne(params.id);
      this.setState({ post });
    } catch(e) {
      console.error(e);
    }
  }

  render() {
    const { post } = this.state;
    if (!post) return <Loader />;
    return (
      <article className="Post">
        <h1 className="Post-title">{post.title}</h1>
        <p className="Post-body">{post.body}</p>
      </article>
    );
  }
}

export default Post;
