doc "Since sequences are immutable, this class is used for
     constructing a new sequence by incrementally appending 
     elements to the empty sequence. This class is mutable
     but threadsafe."
see (SequenceAppender, join, Singleton)
shared native class SequenceBuilder<Element>() {
    
    doc "The resulting sequence. If no elements have been
         appended, the empty sequence."
    shared native default Element[] sequence;
    
    doc "Append an element to the sequence and return this 
         `SequenceBuilder`"
    shared native SequenceBuilder<Element> append(Element element);
    
    doc "Append multiple elements to the sequence and return 
         this `SequenceBuilder`"
    default shared SequenceBuilder<Element> appendAll({Element*} elements) {
        for (element in elements) {
            append(element);
        }
        return this;
    }
    
    doc "The size of the resulting sequence."
    shared Integer size => sequence.size;
    
    doc "Determine if the resulting sequence is empty."
    shared Boolean empty => size==0;
    
}

doc "This class is used for constructing a new nonempty 
     sequence by incrementally appending elements to an
     existing nonempty sequence. The existing sequence is
     not modified, since `Sequence`s are immutable. This 
     class is mutable but threadsafe."
see (SequenceBuilder)
shared native class SequenceAppender<Element>([Element+] elements) 
        extends SequenceBuilder<Element>() {
    
    doc "The resulting nonempty sequence. If no elements 
         have been appended, the original nonempty 
         sequence."
    shared actual native [Element+] sequence;
    
}