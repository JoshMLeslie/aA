# # Let's allow a Post to be posted to multiple subs!
#
# # This will involve a PostSub join table to describe the many-to-many relationship.
# # Add appropriate DB constraints and model validations to PostSub.
#
# Require that a Post has at least one associated sub.
# Create appropriate associations between:
# =Post
# =Post_Sub
# =Sub
#
# Edit your 'Post' new/edit views to allow the user to select multiple subs via 'checkboxes'.
#
# Structure your HTML form to upload an array of sub_ids nested under post
# Update the PostsController#post_params to accept an array of sub_ids
