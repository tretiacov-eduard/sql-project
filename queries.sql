-- Find artist submissions by given song name
SELECT *
FROM "artists"
WHERE "song_id" IN (
    SELECT "id"
    FROM "songs"
    WHERE "name" = 'Self Care'
);

-- Find all artists by rock category
SELECT *
FROM "artists"
WHERE "category_id" IN (
    SELECT "id"
    FROM "categories"
    WHERE "category" = 'Rock'
);

-- Find all playlists by artist name
SELECT *
FROM "playlists"
WHERE "artist_id" IN (
    SELECT "id"
    FROM "artists"
    WHERE "stage_name" = 'Mac Miller'
);

-- Add new artist
INSERT INTO "artists" ("id", "stage_name")
VALUES (1, "Mac Miller");

--Add new album
INSERT INTO "albums" ("id", "name", "artist_id")
VALUES (1, "Kids", 1);