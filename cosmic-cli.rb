class CosmicCli < Formula
  desc "Cosmic command-line interface"
  homepage "https://shoekstra.github.io/cosmic-cli/"
  head "https://github.com/shoekstra/cosmic-cli.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"github.com/shoekstra/cosmic-cli"
    dir.install buildpath.children - [buildpath/".brew_home"]

    cd dir do
      # Make binary
      system "go", "build", "github.com/shoekstra/cosmic-cli/cmd/cosmic-cli"
      bin.install "cosmic-cli"
    end
  end
end
