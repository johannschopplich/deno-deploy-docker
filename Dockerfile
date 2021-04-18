FROM hayd/alpine-deno:1.9.0

EXPOSE 8080
WORKDIR /app
# USER deno

# Install `deployctl`, see https://deno.com/deploy/docs/deployctl
RUN deno install --allow-read --allow-write --allow-env --allow-net --allow-run --no-check -f https://deno.land/x/deploy/deployctl.ts
RUN deno cache https://deno.land/x/deploy/src/runtime.bundle.js

COPY . .

# Compile the main app so that it doesn't need to be compiled each startup/entry
RUN deno cache main.js

CMD ["deployctl", "run", "--no-check", "main.js"]
