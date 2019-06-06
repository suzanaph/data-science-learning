# Optimization

Um RDD não é cacheado por padrão. É reavalidado toda vez que invocado novamente.

### Cache x Persist

cache - RDD into memory
persist(level) - specifica onde quer ser cacheado (level = memória, didco, off-heap 

### Unpersist
``` scala
unpersist(blocking: Boolean = true): this.type
```

Caching is very useful for applications that re-use an RDD multiple times. Iterative machine learning applications include such RDDs that are re-used in each iteration.
Caching all of the generated RDDs is not a good strategy as useful cached blocks may be evicted from the cache well before being re-used. For such cases, additional computation time is required to re-evaluate the RDD blocks evicted from the cache.
Given a large list of RDDs that are being used multiple times, deciding which ones to cache may be challenging. When memory is scarce, it is recommended to use MEMORY_AND_DISK caching strategy such that evicted blocks from cache are saved to disk. Reading the blocks from disk is generally faster than re-evaluation. If extra processing cost can be afforded, MEMORY_AND_DISK_SER can further reduce the memory footprint of the cached RDDs.


### Coallesce vs Repartition
