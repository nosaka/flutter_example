class GithubRepository {
  /// Repository full name.
  String fullName;

  /// Repository description.
  final String description;

  /// Language in use.
  final String language;

  /// Repository html url.
  final String htmlUrl;

  /// Count of stars.
  final int stargazersCount;

  /// Count of watchers.
  final int watchersCount;

  /// Count of forks repository.
  final int forksCount;

  GithubRepository.fromJson(Map<String, dynamic> json)
      : fullName = json['full_name'],
        description = json['description'],
        language = json['language'],
        htmlUrl = json['html_url'],
        stargazersCount = json['stargazers_count'],
        watchersCount = json['watchers_count'],
        forksCount = json['forks_count'];

  GithubRepository(this.fullName,
      [this.description,
      this.language,
      this.htmlUrl,
      this.stargazersCount = 0,
      this.watchersCount = 0,
      this.forksCount = 0]);
}
