What is ``phairy``?
===================

``phairy`` is a simple command-line photo organizer. It allows you to tag,
export raw photos (currently only [NEF](http://nikonimglib.com/nefcodec/ "")s),
generate thumbnails and backup your precious photos.

Workflow
========

- ``phairy new 2011-02-06 Same shit, different day``
    - after initialization will try to auto-open directory with preferred 
    file navigator
- ``cd`` to newly created photo bucket
- Optionally add some tags with ``phairy tag .`` (to tag whole bucket)
- Optionally add some photo tags with ``phairy tag orig/DSC_0001.NEF``
    to tag only specific photos.
- Export raw files with ``phairy export``
- Generate thumbnails with ``phairy thumb``
- Optionally, but highly recommended, backup your photo bucket with
    ``phairy sync /path/to/backup``

Generated structure
===================

    <some bucket>/
        .phairy-bucket  -- phairy bucket marker, please do not remove it
                        -- (generated by ``phairy new``)
        .tags           -- optional bucket tags (generated by ``phairy tag``)
        orig/           -- original photos (probably raw)
            <any subdir>/               -- can contain subdirs
                .tags                   -- subdir tags
                <any subsubdir>/        -- can contain any depth of subdirs
                    .tags               -- subsubdir tags
                    ...
            <some raw photo>.NEF                -- raw photo
            <some other raw photo>.NEF          -- another one raw photo
            .<some other raw photo>.NEF.tags    -- photo specific tags
            ...
        exports_png/                    -- png exports (``phairy export``)
            <any subdir>/               -- preserves original dir structure
                <any subsubdir>/        -- without depth limits
                    ...
            <some exported.NEF.png          -- exported raw photo
            <some other exported>.NEF.png   -- another one exported raw photo
            ...
        thumbs_600/                     -- thumbnails, restricted to 600px
            <any subdir>/               -- preserves original dir structure
                <any subsubdir>/        -- without depth limits
                    ...
            <some exported.NEF.png          -- exported raw photo
            <some other exported>.NEF.png   -- another one exported raw photo
            ...

Tagging
=======

Tags are applied recursively. So, for example, if we have such self-explanatory
structure:

    2011-02-06 Same shit, different day/
        .tags -- "life routine"
        orig/
            at work/
                .tags -- "work workplace collegues"
                ...
                product-photo.NEF
                .product-photo.NEF.tags -- "product-x -collegues"
                ...
            friends birthday/
                .tags -- "birthday friends drunk -routine"
                ...
                before_entering_the_pub.NEF
                .before_entering_the_pub.NEF.tags -- "john smith -drunk"
                ...
                in-progress.NEF
                .in-progress.NEF.tags -- "funny"
                ...

then:

- ``at work/product-photo.NEF`` tags are: ``life, routine, work, workplace, product-x``
- ``friends birthday/before_entering_the_pub.NEF`` tags are: ``life, birthday, friends, john, smith``
- ``friends birthday/in-progress.NEF`` tags are: ``life, birthday, friends, drunk, funny``

As you may have already noticed, minus sign before any tag means exclude.
