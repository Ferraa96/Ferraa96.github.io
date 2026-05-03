---
layout: page
permalink: /posters/
title: Posters
nav: true
nav_order: 3
---

<!-- Dynamic poster gallery powered by _data/posters.yml -->

<div class="posters">
  <div class="row">
    {% for poster in site.data.posters.posters | sort: "year" | reverse %}
    <div class="col-sm-6 mb-4">
      <div class="card h-100 hoverable">
        <img src="{{ '/assets/posters/' | append: poster.slug | append: '/thumbnail.jpg' | relative_url }}" class="card-img-top" alt="{{ poster.title }}" style="height: 200px; object-fit: cover;">
        <div class="card-body d-flex flex-column">
          <h5 class="card-title">{{ poster.title }}</h5>
          <p class="card-text">
            <strong>{{ poster.conference }}</strong><br>
            <small class="text-muted">{{ poster.date }} | {{ poster.location }}</small>
          </p>
          <div class="btn-group mt-auto" role="group">
            <a href="{{ '/posters/' | append: poster.slug | append: '/' | relative_url }}" class="btn btn-sm btn-outline-primary">View</a>
            <a href="{{ '/assets/posters/' | append: poster.slug | append: '/poster.pdf' | relative_url }}" class="btn btn-sm btn-outline-secondary" target="_blank">POSTER</a>
            <a href="{{ '/assets/posters/' | append: poster.slug | append: '/abstract.pdf' | relative_url }}" class="btn btn-sm btn-outline-secondary" target="_blank">Abstract</a>
          </div>
        </div>
      </div>
    </div>
    {% endfor %}
  </div>
</div>

<style>
.posters .card {
  border: 1px solid #e0e0e0;
  transition: box-shadow 0.3s ease;
}

.posters .card:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.posters .card-title {
  font-size: 1.1rem;
  font-weight: 600;
  color: #2c3e50;
  margin-bottom: 0.75rem;
}

.posters .card-text {
  font-size: 0.95rem;
  line-height: 1.5;
}

.posters .btn-group {
  display: flex;
  gap: 0.5rem;
}

.posters .btn {
  font-size: 0.85rem;
  padding: 0.4rem 0.75rem;
}
</style>
