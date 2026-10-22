# DM&M Skyline Contractors website

Static site (HTML, CSS, JavaScript). The estimate form saves requests to Supabase.

## Files
- `index.html` - the whole website
- `images/` - logo and photos
- `supabase.sql` - creates the table that stores estimate requests
- `.nojekyll` - tells GitHub Pages to serve files as they are

## 1. Set up Supabase (stores the form submissions)
1. Create a project at https://supabase.com
2. Open SQL Editor, paste everything from `supabase.sql`, and click Run
3. Go to Project Settings > API and copy the Project URL and the `anon` public key
4. In `index.html`, search for `YOUR_SUPABASE_URL` and replace both placeholders with your values

The anon key is meant to be public. Row Level Security (in the SQL) lets visitors submit requests only, so nobody can read your data from the website. View requests in Supabase under Table Editor > estimate_requests.

## 2. Put it on GitHub Pages (hosts the website)
1. Create a new GitHub repository and upload all files from this folder (keep the `images` folder)
2. Go to Settings > Pages
3. Under Build and deployment, choose Deploy from a branch, select `main` and `/ (root)`, then Save
4. After a minute your site is live at `https://YOUR-USERNAME.github.io/YOUR-REPO/`

For a custom domain, add it under Settings > Pages and follow GitHub's DNS instructions.

## Notes
- Supabase does not host websites, so GitHub Pages serves the site and Supabase stores the form data.
- To get an email for each new request, use Supabase Database Webhooks with an Edge Function, or a service like Zapier.
