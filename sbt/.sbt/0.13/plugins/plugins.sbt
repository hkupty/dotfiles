resolvers ++= Seq(
  "Sonatype OSS Releases" at "https://oss.sonatype.org/content/repositories/releases/",
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots/"
)

addSbtPlugin("com.dscleaver.sbt" % "sbt-quickfix" % "0.4.1")
addSbtPlugin("net.ceedubs" %% "sbt-ctags" % "0.2.0")
addSbtPlugin("org.ensime" % "ensime-sbt" % "0.4.0")
