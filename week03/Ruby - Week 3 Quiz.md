# Week 3 Quiz

1. What is HTML? What is CSS? What is Javascript?

<pre><code>Hypertext Markup Language - creates the overall webpage arrangement through the use of the DOM.

  Cascading Style Sheet allows for styling to be applied/overriden throughout your entire site, or on a per page basis.
  
  Javascript allows client-side scripts to interact with the user, control the browser, communicate asynchronously, and alter the document content that is displayed.
  
  HTML is the skeleton. CSS is the skin. Javascript is the animation.</code></pre>

2. What are the major parts of an HTTP request?

<pre><code>an HTTP request is composed  of three components:
  1-HTTP verb/method (GET/POST/PUT/DELETE)
  2-url that contains: protocol-host-port-resource path-query
  3-parameters
  </code></pre>

3. What are the major parts of an HTTP response?

<pre><code>A HTTP response is composed of:
  1-status code
  2-payload/message body
  </code></pre>

4. How do you submit an HTTP POST request, with a "username" attribute set to "bob"? What if we wanted a GET request instead?

<pre><code>
  </code></pre>

5. Why is it important for us, as web developers, to understand that HTTP is a "stateless" protocol?

<pre><code>It's important because we need to simulate some sort of state or persistence. Since there is no such thing as a state, every request the app reconstitutes the world. We must pull info from a db/caching mechanism to simulate persistence.
</code></pre>

6. If the internet is just HTTP requests/responses, why do we only use browsers to interface with web applications? Are there any other options?

<pre><code>
</code></pre>

7. What is MVC, and why is it important?

<pre><code>Model/View/Controller
  -when a request comes in, the controller/actions will handle it
  -then based on the request compeonent (url/http verb/parameters) will do something
  -model layer interfaces with a relationsip db
  -then either render (http status 200) or redirect (http status 302 and an url)
  -it's important as it's the basis of apps like sintra and rails
</code></pre>

The below questions are about Sinatra:

8. At a high level, how are requests processed?

<pre><code>A route is made that is an http methods paired with an url-matching pattern.
</code></pre>

9. In the controller/action, what's the difference between rendering and redirecting?

<pre><code>Rendering will show a template for the given action, while redirecting will move to a different action and thus a differnet view for display.
</code></pre>

10. In the ERB view template, how do you show dynamic content?

<pre><code><%= yield %>
</code></pre>

11. Given what you know about ERB templates, when do you suppose the ERB template is turned into HTML?

<pre><code>After the ruby code is evaluated.
</code></pre>

12. What's the role of instance variables in Sinatra?

<pre><code>To allow templates to access information submitted/posted to the actions.
</code></pre>