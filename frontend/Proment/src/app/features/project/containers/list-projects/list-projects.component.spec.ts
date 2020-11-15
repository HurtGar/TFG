import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListProjectComponent } from './list-projects.component';

describe('ShowProjectsComponent', () => {
  let component: ListProjectComponent;
  let fixture: ComponentFixture<ListProjectComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListProjectComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListProjectComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
