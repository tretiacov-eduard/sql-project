-- Reprsent categories
CREATE TABLE "category" (
    "id" INTEGER,
    "category" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent artists
CREATE TABLE "artists" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "stage_name" TEXT NOT NULL,
    "date_of_birth" NUMERIC,
    "date_of_death" NUMERIC,
    "record_label" TEXT NOT NULL,
    "category_id" INTEGER,
    "album_id" INTEGER,
    "playlist_id" INTEGER,
    "song_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("category_id") REFERENCES "category"("id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id"),
    FOREIGN KEY("playlist_id") REFERENCES "playlists"("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

-- Represent albums
CREATE TABLE "albums" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "release_date" NUMERIC,
    "total_duration" NUMERIC NOT NULL,
    "artist_id" INTEGER,
    "song_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

--Represent plyalists
CREATE TABLE "playlists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "duration" NUMERIC,
    "artist_id" INTEGER,
    "song_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

--Represent songs
CREATE TABLE "songs" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "duration" NUMERIC NOT NULL,
    "artist_id" INTEGER,
    "album_id" INTEGER,
    "playlist_id" INTEGER,
    "lyrics_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("lyrics_id") REFERENCES "lyrics"("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id"),
    FOREIGN KEY("playlist_id") REFERENCES "playlists"("id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id")
);

-- Represent lyrics
CREATE TABLE "lyrics" (
    "id" INTEGER,
    "text" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Create indexes to speed common searches
CREATE INDEX "artist_stage_name_index" ON "artists" ("stage_name");
CREATE INDEX "album_name_index" ON "albums" ("name")