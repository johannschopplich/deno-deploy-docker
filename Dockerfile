FROM denoland/deno:1.10.3

EXPOSE 1993
WORKDIR /app
# USER deno

# Install `deployctl`, see https://deno.com/deploy/docs/deployctl
RUN deno install --allow-read --allow-write --allow-env --allow-net --allow-run --no-check -f https://deno.land/x/deploy@0.3.0/deployctl.ts
RUN deno cache https://deno.land/x/deploy@0.3.0/src/runtime.bundle.js

COPY . .

# Prevent compilation at each startup/entry
RUN deno cache main.js

CMD ["deployctl", "run", "--no-check", "main.js"]
