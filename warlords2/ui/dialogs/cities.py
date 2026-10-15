"""View -> Cities (menu 525, key 'c'): the city screen's City Info page at the view centre.

Evidence: the key case 07be:01b5 (0x63 in the switch 07be:0337, the key of menu record 525 in
DS:1798) -> ovl45:0000(0, SCN 0x17d, SCN 0x17f): the nearest city of any owner to the view
centre whose squares pass ovl64:15ff (`ui.dialogs.production.open_city_screen`).  The page is
`ui.dialogs.city_info`.
"""
from __future__ import annotations

from .. import registry

SCN_VIEW_CX, SCN_VIEW_CY = 0x17D, 0x17F


@registry.action(registry.MENU_ID["cities"])
def view_cities(host):
    from .production import INFO, open_city_screen
    st = getattr(host, "state", None)
    if st is None:
        return None
    return open_city_screen(host, INFO, st.flags.get(SCN_VIEW_CX, 0), st.flags.get(SCN_VIEW_CY, 0))
