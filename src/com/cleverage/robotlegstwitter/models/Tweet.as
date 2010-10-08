package com.cleverage.robotlegstwitter.models
{
  public class Tweet
  {
    public var content : String;
    public var authorName : String;
    public var authorUri : String;
    
    public function Tweet()
    {
    }
    
    public function fromAtomEntry(entry : XML, namespace : Namespace) : void
    {
      content = entry.namespace::content;
      authorName = entry.namespace::author.name;
      authorUri = entry.namespace::author.namespace::uri;
    }
  }
}