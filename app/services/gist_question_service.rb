class GistQuestionService < ApplicationService
  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    responce = @client.create_gist(gist_params)

    if responce.id.present?
      GistResponceData.new(success?: true, gist_url: responce.html_url)
    else
      GistResponceData.new(success?: false)
    end
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def gist_params
    {
      description: I18n.t('description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end

GistResponceData = Struct.new(:success?, :gist_url)
