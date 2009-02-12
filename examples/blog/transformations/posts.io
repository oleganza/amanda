
Layout := transformation(blog, element,
  element first("head title") setInnerText(blog title)
  element first("h1") setInnerText(blog title)
  element first("#current-year") setInnerText(Date clone year)
)

ShowPosts := transformation(posts, element,
  element first("#posts") apply(PostsList, posts)
)

PostsList := transformation(posts, element,
  element fillWithCollection(SinglePost, posts, element first(".post"))
)

SinglePost := transformation(post, element,
  element first("h2 a") set("href", post permaLink) setInnerHTML(post title)
  element first("p.time small") setInnerHTML(post updatedAt)
  element second("p") setInnerHTML(post body)
)

