{% if page.comments %}

  {% if theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}
    <div class="comments" id="comments">
      <div class="fb-comments"
           data-href="{{ page.permalink }}"
           data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
           data-width="{{ theme.facebook_comments_plugin.width }}"
           data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
      </div>
    </div>

  {% elif theme.vkontakte_api.enable and theme.vkontakte_api.comments %}
    <div class="comments" id="comments">
      <div id="vk_comments"></div>
    </div>

  {% elif theme.disqus.enable or (theme.disqusjs.enable and theme.disqusjs.apikey and theme.disqusjs.shortname) %}
    <div class="comments" id="comments">
      <div id="disqus_thread">
        <noscript>{#
        #}Please enable JavaScript to view the comments powered by Disqus.{#
      #}</noscript>
      </div>
    </div>

  {% elif theme.livere_uid %}
    <div class="comments" id="comments">
      <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
    </div>

  {% elif theme.changyan.enable and theme.changyan.appid and theme.changyan.appkey %}
    <div class="comments" id="comments">
      <div id="SOHUCS"></div>
    </div>


  {% elif theme.gitment.enable %}
    <div class="comments" id="comments">
      {% if theme.gitment.lazy %}
        <div onclick="showGitment()" id="gitment-display-button">{{ __('gitmentbutton') }}</div>
        <div id="gitment-container" style="display: none"></div>
      {% else %}
        <div id="gitment-container"></div>
      {% endif %}
    </div>

    <div id="container" style="display:none"></div>
    <link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
    <script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
    <script>
    const myTheme = {
    render(state, instance) {
    const container = document.createElement('div');
    container.lang = "en-US";
    container.className = 'gitment-container gitment-root-container';
    container.appendChild(instance.renderHeader(state, instance));
    container.appendChild(instance.renderEditor(state, instance));
    container.appendChild(instance.renderComments(state, instance));
    container.appendChild(instance.renderFooter(state, instance));
    return container;
    }
    }
    function showGitment() {
    $("#gitment_title").attr("style", "display:none");
    $("#container").attr("style", "").addClass("gitment_container");
    var gitment = new Gitment({
    id: window.location.pathname,
    theme: myTheme,
    owner: '{{ theme.gitment.owner }}',
    repo: '{{ theme.gitment.repo }}',
    oauth: {
    client_id: '{{ theme.gitment.client_id }}',
    client_secret: '{{ theme.gitment.client_secret }}'
    }
    });
    gitment.render('container');
    }
    </script>


{% endif %}


