resolvers ++= Seq(
  "Sonatype OSS Releases" at "https://oss.sonatype.org/content/repositories/releases/",
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots/"
)

addSbtPlugin("net.ceedubs" %% "sbt-ctags" % "0.2.0")
addSbtPlugin("org.ensime" % "ensime-sbt" % "0.3.2")
addSbtPlugin("de.johoop" % "cpd4sbt" % "1.1.5")
