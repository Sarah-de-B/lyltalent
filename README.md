Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


<div class="applications-list">
    <% @applications.each do |application| %>
      <%= link_to entertainment_path(application.entertainment), class: "application-card" do %>
        <div class="application-card-image">

          <% if application.entertainment.event.photo.attached? %>
            <%= cl_image_tag(application.entertainment.event.photo.key, alt: "Image de l'événement", class: "application-card-img") %>
          <% else %>
            <%= image_tag "default_event.jpg", alt: "Image par défaut", class: "application-card_img" %>
          <% end %>

          <% if application.status == "Proposé" %>
            <div class="status"><p class="application-card-status-proposed"><%= application.status %></p></div>
          <% elsif application.status == "Validé" %>
            <div class="status"><p class="application-card-status-validate"><%= application.status %></p></div>
          <% else %>
            <div class="status"><p class="application-card-status-refuse"><%= application.status %></p></div>
          <% end %>

        </div>

        <div class="application-card-content">
          <h3 class="application-card-title"><%= application.entertainment.event.name %></h3>
          <p class="application-card-description"><%= application.entertainment.event.description %></p>
        </div>
      <% end %>
    <% end %>
  </div>
